import Control.Monad
import Data.List
import System.Environment
import System.Exit
import System.IO
import System.Random
import Control.Concurrent
import System.Process
import System.Environment

diff = do
    img <- openFile "/sys/class/net/eth0/statistics/tx_bytes" ReadMode
    time <- hGetLine img
    hClose img

    threadDelay $ 1000 * 1000

    img <- openFile "/sys/class/net/eth0/statistics/tx_bytes" ReadMode
    time_dx <- hGetLine img
    hClose img

    print $ (read time_dx :: Int) - (read time :: Int)

    diff

    return ()

main = do
    --args <- getArgs
    --g    <- newStdGen

    --when (null args) $ error "Usage: ./rule110 steps size"

    --img <- openFile "/sys/class/net/eth0/statistics/tx_bytes" ReadMode

    --str <- hGetLine img

    --putStrLn str

    diff

    return ()
