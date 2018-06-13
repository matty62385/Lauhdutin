Game = require('main.game')

bannerExtensions = {
	'.jpg'
	'.png'
}

class Platform
	new: (settings) =>
		assert(type(settings) == 'table', 'main.platforms.platform.Platform')

	validate: () => assert(nil, 'Platform has not implemented the validate method.')

	isEnabled: () => return @enabled == true

	getPlatformID: () => return @platformID

	getPlatformProcess: () => return @platformProcess

	getName: () => return @name

	getGames: () => return @games or {}

	getBannerPath: (fileWithoutExtension, bannerPath = @cachePath) =>
		pathWithoutExtension = io.joinPaths(bannerPath, fileWithoutExtension)
		for extension in *bannerExtensions
			path = pathWithoutExtension .. extension
			return path if io.fileExists(path)
		return nil

	getBannerExtensions: () => return bannerExtensions

	getCachePath: () => return @cachePath

	getStorePageURL: (game) => return nil

	getBannerURL: (game) => return nil

return Platform
