
data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)

data Atendimento = Atendimento
  { cliente :: String
  , servico :: String
  , valor :: Double
  , etapa :: Etapa
  }

descrever :: Atendimento -> String
descrever a = cliente a ++ " - " ++ servico a ++ " - " ++ show (etapa a)

concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))

main :: IO ()
main = do
  let atendimento1 = Atendimento
        { cliente = "Haku", servico = "Banho especial", valor = 40.0, etapa = NaFila }
  let atendimento2 = Atendimento
        { cliente = "Sem Rosto", servico = "Banho comum", valor = 25.0, etapa = NoBanho }
  let atendimento3 = Atendimento
        { cliente = "Espírito do Rio", servico = "Limpeza", valor = 60.0, etapa = NaFila }

  let original = [atendimento1, atendimento2, atendimento3]
  let nova = [concluir atendimento1, atendimento2, concluir atendimento3]

  putStrLn "Atendimentos originais:"
  mapM_ putStrLn (map descrever original)
  putStrLn ("Total arrecadado: R$ " ++ show (arrecadado original))

  putStrLn "Atendimentos atualizados:"
  mapM_ putStrLn (map descrever nova)
  putStrLn ("Total arrecadado: R$ " ++ show (arrecadado nova))
