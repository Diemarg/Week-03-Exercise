import Data.List
main :: IO()
main = do
    nCases <- getLine
    testCase 1 (read nCases::Int)

testCase :: Int -> Int -> IO()
testCase currentCase totalCases = do{
    if (currentCase <= totalCases)
        then do
            getPrinterData 1 [1000000,1000000,1000000,1000000] currentCase
            testCase (currentCase+1) totalCases
    else pure()
}

getPrinterData :: Int -> [Integer] -> Int -> IO()
getPrinterData currentPrinter minInk currentCase = do {
    if (currentPrinter <= 3)
        then do
            ink <- getLine
            let currentInk = map (read::String->Integer) (words ink)
            let newMinInk = getMinInk currentInk minInk
            getPrinterData (currentPrinter+1) newMinInk currentCase
    else 
        printMin minInk currentCase
}

getMinInk :: [Integer] -> [Integer] -> [Integer]  
getMinInk currentInk prevInk = map (\(x,y) -> if x < y then x else y) $ zip currentInk prevInk

printMin :: [Integer] -> Int -> IO()
printMin ink currentCase
    | (sum ink) < 1000000 = putStrLn ("Case #" ++ show currentCase ++ ": IMPOSSIBLE")
    | (sum ink) == 1000000 = putStrLn ("Case #" ++ show currentCase ++ ": " ++ ( unwords (map show ink) ))
    | otherwise = putStrLn ("Case #" ++ show currentCase ++ ": " ++ ( unwords (map show (substractLeftovers ink) )))

substractLeftovers :: [Integer] -> [Integer]
substractLeftovers list
    | sum list == 1000000 = list
    | sum (tail list) > 1000000 = [0] ++ substractLeftovers (tail list)
    | otherwise = [1000000 - sum (tail list)] ++ (tail list)