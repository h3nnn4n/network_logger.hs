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
    file <- openFile "/sys/class/net/eth0/statistics/tx_bytes" ReadMode
    tx <- hGetLine file
    hClose file

    file <- openFile "/sys/class/net/eth0/statistics/rx_bytes" ReadMode
    rx <- hGetLine file
    hClose file

    threadDelay $ 1000 * 1000

    file <- openFile "/sys/class/net/eth0/statistics/tx_bytes" ReadMode
    tx_dx <- hGetLine file
    hClose file

    file <- openFile "/sys/class/net/eth0/statistics/rx_bytes" ReadMode
    rx_dx <- hGetLine file
    hClose file

    let rr = ((read rx_dx :: Int) - (read rx :: Int))
        tt = ((read tx_dx :: Int) - (read tx :: Int))

    putStrLn $ (show rr) ++ " " ++ (show tt)

    diff

main = do
    diff
