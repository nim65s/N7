function [bits,dict] = c_source(texte);

% [bits,dict] = c_source(texte) 
% renvoie la suite de bits 'bits' correspondant au codage 
% de Huffman de la chaine de caractères 'texte'
% ainsi que le dictionnaire 'dict' utilisé

load dico

Texte = cell(1,length(texte));
for k=1:length(texte),
    Texte{k}=texte(k);
end;

bits = huffmanenco(Texte,dict);