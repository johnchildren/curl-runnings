module Main where

import           Data.Either
import           System.Directory
import           Test.Hspec
import           Testing.CurlRunnings

main :: IO ()
main = hspec $
  describe "Curl Runnings" $ do
  it "should provide valid example yaml specs" $
    testValidSpec "/examples/example-spec.yaml"

  it "should provide valid example json specs" $
    testValidSpec "/examples/example-spec.json"

testValidSpec :: String -> IO ()
testValidSpec file = do
  currentDirectory <- getCurrentDirectory
  spec <- decodeFile (currentDirectory ++ file)
  spec `shouldSatisfy` isRight


