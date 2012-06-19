function texte = d_source(bits,dict);

% renvoie le texte obtenu par le d�codage
% de la suite de bits 'bits' lorsque le
% dictionnaire utilis� pour le codage est 'dict'

texte = huffmandeco(bits,dict);
texte = char(texte);
texte = texte(:)';

