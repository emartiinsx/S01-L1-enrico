pinCorreto = 4321

INPUT "Digite o PIN: ", pin

WHILE pin <> pinCorreto
    PRINT "PIN invalido. Tente novamente."
    INPUT "Digite o PIN: ", pin
WEND

PRINT "Transacao autorizada!"