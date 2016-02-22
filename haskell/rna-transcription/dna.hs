module DNA where

data DNANucleotid = DA | DC | DG | DT
data RNANucleotid = RA | RC | RG | RU

strToDNA :: Char -> DNANucleotid
strToDNA 'A' = DA
strToDNA 'C' = DC
strToDNA 'G' = DG
strToDNA 'T' = DT
strToDNA _ = error "Not a known dna nucleotid"

rnaToStr :: RNANucleotid -> Char
rnaToStr RA = 'A'
rnaToStr RC = 'C'
rnaToStr RG = 'G'
rnaToStr RU = 'U'

complement :: DNANucleotid -> RNANucleotid
complement DA = RU
complement DG = RC
complement DC = RG
complement DT = RA

toRNA :: String -> String
toRNA dna = let
  dna_list = map strToDNA dna in
  map (rnaToStr . complement) dna_list
