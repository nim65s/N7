function texte = d_source(bits,dict);

% renvoie le texte obtenu par le décodage
% de la suite de bits 'bits' lorsque le
% dictionnaire utilisé pour le codage est 'dict'

texte = huffmandeco(bits,dict);
texte = char(texte);
texte = texte(:)';

