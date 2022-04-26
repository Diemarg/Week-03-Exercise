import Data.List

-- Receive the amount of cases
main :: IO()
main = do
    nCases <- getLine
    testCase 1 (read nCases::Int)

-- Recursive function for receiving the data of each case
testCase :: Int -> Int -> IO()
testCase currentCase totalCases = do {
    if currentCase <= totalCases
        then do
            getPrinterData 1 [1000000,1000000,1000000,1000000] currentCase
            testCase (currentCase+1) totalCases
    else pure()
}

-- Recursive function for receiving the data of the three printers
getPrinterData :: Int -> [Integer] -> Int -> IO()
getPrinterData currentPrinter minInk currentCase = do {
    if currentPrinter <= 3
        then do
            ink <- getLine
            -- Checks if there's a new minimum of ink   
            let newMinInk = storeMinInk ink minInk
            getPrinterData (currentPrinter+1) newMinInk currentCase
    else
        putStrLn ("Case #" ++ show currentCase ++ ": " ++ checkIfSolvable minInk)
}

-- Compares the ink of the current printer to the array
-- that stores the minimum ink available of each color to 
-- find out if there's a new minimum for any of the colors.
-- It compares elements of both lists that are in the same position.
storeMinInk :: String -> [Integer] -> [Integer]
storeMinInk ink minInk = do
    let currentInk = map (read::String->Integer) (words ink)
    zipWith (\ new prev -> (if new < prev then new else prev)) currentInk minInk

-- Returns the appropriate string depending on whether the case has a solution or not
checkIfSolvable :: [Integer] -> String
checkIfSolvable ink
    | sum ink < 1000000 = "IMPOSSIBLE"
    | sum ink == 1000000 = unwords (map show ink)
    | otherwise = unwords (map show (substractExcess ink))

-- Function that analyzes element by element the array of minimum values for
-- deleting the excess of ink until the list sums 1,000,000
substractExcess :: [Integer] -> [Integer]
substractExcess list
    | sum list == 1000000 = list
    | sum (tail list) > 1000000 = 0 : substractExcess (tail list)
    | otherwise = (1000000 - sum (tail list)) : tail list