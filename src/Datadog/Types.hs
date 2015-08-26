{-# LANGUAGE DeriveGeneric #-}

module Datadog.Types where

import GHC.Generics (Generic)

type Host = String
type Time = Int
type Point = (Time, Double)
type Tag = String
type AggregationKey = String

data Gauge =
    Gauge
  | Counter deriving (Show, Generic)

data Priority =
    Normal
  | Low deriving (Show, Generic)

data AlertType =
    Success
  | Info
  | Warning
  | Error deriving (Show, Generic)

data SourceType =
    Git
  | Gerrit
  | Jenkins
  | User
  | Service String deriving (Show, Generic)

data Event = Event
  { eventTitle :: String
  , eventText :: String
  , eventPriority :: Priority
  , eventTags :: [Tag]
  , eventAlertType :: AlertType
  , eventAggregationKey :: AggregationKey
  , eventSourceType :: SourceType
  } deriving (Show, Generic)

data Metric = Metric
  { metricName :: String
  , metricPoints  :: [Point]
  , metricType :: Gauge
  , metricHost :: Host
  , metricTags :: [Tag]
  } deriving (Show, Generic)

data Series = Series [Metric] deriving (Show, Generic)

data Downtime = Downtime
  { downtimeScope   :: String
  , downtimeStart   :: Maybe Time
  , downtimeEnd     :: Maybe Time
  , downtimeMessage :: Maybe String
  } deriving (Show, Generic)

-- FIXME: Needs fleshing out; stubbed for now
type ApiResponse = ()

