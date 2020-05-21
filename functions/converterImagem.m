function [nfiles, max_alt, max_larg] = converterImagem(fn)
% CONVERTERIMAGEM Summary of this function goes here
% Get list of all BMP files in this directory
% DIR returns as a structure array.  You will need to use () and . to get
% the file names.
filename = fn;
direcname = strcat(filename,'/*.jpg');
imagefiles = dir(direcname);
nfiles = length(imagefiles); % Number of files found
max_alt = 0;
max_larg = 0;
count = 0;especieVect=[]; countSub = 0; subespecieVect=[];
load('labels_GT.mat')
load('labels_subespecie.mat')
maxSpecies = max(labels_GT(:,1)); maxSubSpecies = max(labels_subespecie(:,2));
disp('Aguarde enquanto as imagens estão a ser preparadas...')
for ii=1:nfiles
    vetorEspecies = zeros(maxSpecies,1);
    vetorSubEspecies = zeros(maxSubSpecies,1);
    name = imagefiles(ii).name;
    name2 = strtok(name,'.');
    name2number = str2num(name2);
    pos = find(labels_GT(:,2)==name2number);
    if ~isempty(pos)
        especiePos = labels_GT(pos,1);
        especieVect=[especieVect;especiePos];
        vetorEspecies(especiePos) = 1;
        currentfilename = strcat(filename,'/',name);
        currentimage = imread(currentfilename); %vai buscar ficheiro. Read image into the workspace.
        currentimage_a = imbinarize(currentimage);   %binariza imagem
        % get largest connected region in the image
        BW = currentimage_a;
        currentimage_a = zeros (size(BW));
        CC = bwconncomp(BW);
        numPixels = cellfun(@numel,CC.PixelIdxList);
        [biggest,idx] = max(numPixels);
        currentimage_a(CC.PixelIdxList{idx}) = 1;
        s = regionprops(currentimage_a,'ConvexArea','Eccentricity','EquivDiameter','Extent','FilledArea','MajorAxisLength','MinorAxisLength','Orientation','Perimeter','Solidity');
        dummyVector = [s.ConvexArea s.Eccentricity s.EquivDiameter s.Extent s.FilledArea s.MajorAxisLength s.MinorAxisLength s.Orientation s.Perimeter s.Solidity];
        % currentimage_b = currentimage_a(:); % converte matriz em coluna única para input da rede
        [altura, largura] = size(currentimage_a);
        if altura > max_alt
            max_alt = altura;
        end
        if largura > max_larg
            max_larg = largura;
        end
        % disp (currentimage_a);
        count = count + 1;
        images{count} = currentimage_a;
        imagesProperties(count,:) = dummyVector;
        labels(:,count) = vetorEspecies;
    end
    pos_sub = find(labels_subespecie(:,1) == name2number);
    if ~isempty(pos_sub)
        subespeciePos = labels_subespecie(pos_sub,2);
        subespecieVect = [subespecieVect; subespeciePos];
        vetorSubEspecies(subespeciePos)=1;
        currentfilename = strcat(filename,'/',name);
        currentimage = imread(currentfilename); %vai buscar ficheiro. Read image into the workspace.
        currentimage_a = imbinarize(currentimage);   %binariza imagem
        % get largest connected region in the image
        BW = currentimage_a;
        currentimage_a = zeros (size(BW));
        CC = bwconncomp(BW);
        numPixels = cellfun(@numel,CC.PixelIdxList);
        [biggest,idx] = max(numPixels);
        currentimage_a(CC.PixelIdxList{idx}) = 1;
        s = regionprops(currentimage_a,'ConvexArea','Eccentricity','EquivDiameter','Extent','FilledArea','MajorAxisLength','MinorAxisLength','Orientation','Perimeter','Solidity');
        dummyVector = [s.ConvexArea s.Eccentricity s.EquivDiameter s.Extent s.FilledArea s.MajorAxisLength s.MinorAxisLength s.Orientation s.Perimeter s.Solidity];
        % currentimage_b = currentimage_a(:);
        %converte matriz em coluna única para input da rede
        [altura, largura] = size(currentimage_a);
        if altura > max_alt
            max_alt = altura;
        end
        if largura > max_larg
            max_larg = largura;
        end
        % disp (currentimage_a);
        countSub = countSub + 1;
        imagesSub{countSub} = currentimage_a;
        imagesPropertiesSub(countSub,:) = dummyVector;
        labelsSubEspecies(:,countSub) = vetorSubEspecies;
    end
end
matriz_maior = [max_alt; max_larg];
for jj=1:count
    preta = zeros(max_alt,max_larg);
    currentimage_a = images{jj};
    [altura, largura] = size(currentimage_a);
    alt = round((max_alt - altura)/2);
    larg = round((max_larg - largura)/2);
    %     size(preta( larg:larg+largura-1,alt:alt+altura-1))
    preta(alt+1:alt+altura, larg+1:larg+largura) = currentimage_a;
    %images{jj} = imresize(preta,[32 32]);
    thisImage =  imresize(preta,[32 32]);
    thisVector = thisImage(:);
    imagesvectorized(jj,:) = thisVector;
end

for jj=1:countSub
    preta = zeros(max_alt,max_larg);
    currentimage_a = imagesSub{jj};
    [altura, largura] = size(currentimage_a);
    alt = round((max_alt - altura)/2);
    larg = round((max_larg - largura)/2);
    %     size(preta( larg:larg+largura-1,alt:alt+altura-1))
    preta(alt+1:alt+altura, larg+1:larg+largura) = currentimage_a;
    %images{jj} = imresize(preta,[32 32]);
    thisImage =  imresize(preta,[32 32]);
    thisVector = thisImage(:);
    imagesvectorizedSub(jj,:) = thisVector;
end
% imcomplement(bw); % Reverse Black and White in a Binary Image
%      currentimage_a =  imresize(currentimage,[64 64]); %redimensiona imagem --> no of rows and columns can be selected according to aspect ratio.
save('imagesvectorized.mat','imagesvectorized')
save('imagesvectorizedSub.mat','imagesvectorizedSub')
save('labels.mat','labels')
save('labelsSubEspecies.mat','labelsSubEspecies')
save('imagesProperties.mat','imagesProperties')
save('imagesPropertiesSub.mat','imagesPropertiesSub')
disp('As imagens estão prontas para entrar na rede!')