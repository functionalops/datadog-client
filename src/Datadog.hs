{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Datadog where

import Datadog.Types
import Datadog.JSON

import Servant
import Servant.Client

type API =
       "validate"   :> QueryParam "api_key" String
                    :> Get '[JSON] ApiResponse
  :<|> "series"     :> QueryParam "api_key" String
                    :> QueryParam "application_key" String
                    :> ReqBody '[JSON] Series :> Post '[JSON] ApiResponse
  :<|> "events"     :> QueryParam "api_key" String
                    :> QueryParam "application_key" String
                    :> ReqBody '[JSON] Event :> Post '[JSON] ApiResponse
  :<|> "downtime"   :> QueryParam "api_key" String
                    :> QueryParam "application_key" String
                    :> ReqBody '[JSON] Downtime
                    :> Post '[JSON] ApiResponse
  :<|> "tags/hosts" :> QueryParam "api_key" String
                    :> QueryParam "application_key" String
                    :> Post '[JSON] ApiResponse

api :: Proxy API
api = Proxy

validate :<|> series :<|> events :<|> downtime = client api (BaseUrl Https "app.datadoghq.com" 443)
