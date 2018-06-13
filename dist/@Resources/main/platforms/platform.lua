local Game = require('main.game')
local bannerExtensions = {
  '.jpg',
  '.png'
}
local Platform
do
  local _class_0
  local _base_0 = {
    validate = function(self)
      return assert(nil, 'Platform has not implemented the validate method.')
    end,
    isEnabled = function(self)
      return self.enabled == true
    end,
    getPlatformID = function(self)
      return self.platformID
    end,
    getPlatformProcess = function(self)
      return self.platformProcess
    end,
    getName = function(self)
      return self.name
    end,
    getGames = function(self)
      return self.games or { }
    end,
    getBannerPath = function(self, fileWithoutExtension, bannerPath)
      if bannerPath == nil then
        bannerPath = self.cachePath
      end
      local pathWithoutExtension = io.joinPaths(bannerPath, fileWithoutExtension)
      for _index_0 = 1, #bannerExtensions do
        local extension = bannerExtensions[_index_0]
        local path = pathWithoutExtension .. extension
        if io.fileExists(path) then
          return path
        end
      end
      return nil
    end,
    getBannerExtensions = function(self)
      return bannerExtensions
    end,
    getCachePath = function(self)
      return self.cachePath
    end,
    getStorePageURL = function(self, game)
      return nil
    end,
    getBannerURL = function(self, game)
      return nil
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, settings)
      return assert(type(settings) == 'table', 'main.platforms.platform.Platform')
    end,
    __base = _base_0,
    __name = "Platform"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Platform = _class_0
end
return Platform
