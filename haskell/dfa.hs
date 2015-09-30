-- DFA definition
type DFA = ([Int], [Char], Int -> Char -> Int, Int, Int -> Bool)

evalDFA :: DFA -> String -> Bool
evalDFA (states, alpha, delta, start, end) (w) =
	evalDFA' (states, alpha, delta, start, end) start w

evalDFA' :: DFA -> Int -> String -> Bool
evalDFA' (states, alpha, delta, start, end) a [] = (end a)
evalDFA' (states, alpha, delta, start, end) a (x:xs) =
	evalDFA' (states, alpha, delta, start, end) (delta a x) xs

-- Even DFA
trans :: Int -> Char -> Int
trans 1 a = 2
trans 2 a = 1

accept :: Int -> Bool
accept 1 = True
accept 2 = False

evenDFA = ([1, 2], ['a', 'b'], trans, 1, accept) :: DFA