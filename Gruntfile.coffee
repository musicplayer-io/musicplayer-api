module.exports = (grunt) =>
	grunt.initConfig
		coffee:
			lib:
				files:
					"lib/musicplayer.js": "src/index.coffee"

	grunt.loadNpmTasks "grunt-contrib-coffee"
	grunt.registerTask "default", ["coffee"]
