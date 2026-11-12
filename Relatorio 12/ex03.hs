
data Esboco = Esboco
  { titulo :: String
  , tecnica :: String
  , horas :: Int
  }

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente [] = "O caderno esta vazio."
esbocoMaisRecente (e:_) = titulo e ++ " - " ++ tecnica e

contarEsbocos :: [Esboco] -> Int
contarEsbocos [] = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando [] = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto

main :: IO ()
main = do
  let caderno =
        [ Esboco { titulo = "Castelo", tecnica = "Grafite", horas = 4 }
        , Esboco { titulo = "Dragao", tecnica = "Nanquim", horas = 6 }
        , Esboco { titulo = "Floresta", tecnica = "Carvao", horas = 3 }
        ]

  putStrLn "Caderno original:"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Quantidade: " ++ show (contarEsbocos caderno))
  putStrLn ("Total de horas: " ++ show (horasDesenhando caderno))
  putStrLn (esbocoMaisRecente [])

  let cadernoNovo =
        Esboco { titulo = "Ruinas", tecnica = "Nanquim", horas = 5 } : caderno

  putStrLn "Caderno novo:"
  putStrLn (esbocoMaisRecente cadernoNovo)
  putStrLn ("Quantidade: " ++ show (contarEsbocos cadernoNovo))

  putStrLn "Caderno original continua igual:"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Quantidade: " ++ show (contarEsbocos caderno))

  -- putStrLn (titulo (head []))
