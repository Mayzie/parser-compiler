
module Imp.Source.Check.UndefinedFunc where
import Imp.Source.Check.Error
import Imp.Source.Exp


-- | Check that the program references no undefined functions.
-- ToDo
checkUndefinedFunc :: Program -> [Error]
checkUndefinedFunc (Program funs)
 = []