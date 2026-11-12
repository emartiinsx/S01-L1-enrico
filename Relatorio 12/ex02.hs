
pesoMaximo :: Double
pesoMaximo = 5.0
-- pesoMaximo = 8.0

data Encomenda = Encomenda
  { destinatario :: String
  , peso :: Double
  , frete :: Double
  }

descrever :: Encomenda -> String
descrever e =
  destinatario e ++ " - " ++ show (peso e) ++ " kg - R$ " ++ show (frete e)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas =
  filter (\e -> peso e <= pesoMaximo) encomendas

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)

main :: IO ()
main = do
  let encomendas =
        [ Encomenda { destinatario = "Ana", peso = 2.0, frete = 10.0 }
        , Encomenda { destinatario = "Bruno", peso = 7.0, frete = 18.0 }
        , Encomenda { destinatario = "Carla", peso = 4.5, frete = 15.0 }
        , Encomenda { destinatario = "Diego", peso = 6.0, frete = 20.0 }
        ]

  let aceitas = cabemNaVassoura encomendas

  putStrLn "Todas as encomendas:"
  mapM_ putStrLn (map descrever encomendas)
  putStrLn "Encomendas que cabem na vassoura:"
  mapM_ putStrLn (map descrever aceitas)
  putStrLn ("Total de fretes: R$ " ++ show (totalDeFretes aceitas))
