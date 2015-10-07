
module Imp.Core.Execute where
import qualified Imp.Core.Exp           as C


-- | Execute a program from the core language
executeProgram :: C.Program -> [Int] -> String
executeProgram (C.Program funs) args
        = do let search1 = searchFunction funs (C.Id "main")
             case search1 of
                Just (C.Function _ _ blks)
                    -> do let search2 = searchBlock blks 0
                          case search2 of
                              Just blk
                                  -> "Block 0 is found!"
                              Nothing
                                  -> "Block 0 not found"
                Nothing
                    -> "Main not found"
        -- = "Testing"
        -- Above is just temporary to make sure the flow works


-- | Execute the given Function
executeFunction :: C.Function -> String
executeFunction _ = ""
-- Will go through the Function and execute Block 0


-- | Execute the given Block
executeBlock :: C.Block -> String
executeBlock _ = ""
-- Will go through the Block and execute each Instr


-- | Execute the given Instr
executeInstr :: C.Instr -> String
executeInstr _ = ""
-- Will execute the Instr


-- | Search for the given Function | Tested and works!
searchFunction :: [C.Function] -> C.Id -> Maybe C.Function
searchFunction [] _ = Nothing
searchFunction (fun : funs) (C.Id expName)
        = case fun of
            (C.Function (C.Id actName) _ _)
                -> if (actName == expName)
                    then (Just fun)
                    else searchFunction funs (C.Id expName)


-- | Search for the given Block | Tested and works!
searchBlock :: [C.Block] -> Int -> Maybe C.Block
searchBlock [] _ = Nothing
searchBlock (blk : blks) expNum
        = case blk of
            (C.Block actNum _)
                -> if (actNum == expNum)
                    then (Just blk)
                    else searchBlock blks expNum


-- | Search for the given Instr
searchInstr :: C.Block -> Int -> Maybe C.Instr
searchInstr _ _ = Nothing
