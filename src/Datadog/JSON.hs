module Datadog.JSON where

import Datadog.Types

import GHC.Generics (Generic)

import Data.Aeson

instance ToJSON Gauge
instance ToJSON Priority
instance ToJSON AlertType
instance ToJSON SourceType
instance ToJSON Event
instance ToJSON Metric
instance ToJSON Series
instance ToJSON Downtime

