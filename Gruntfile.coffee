module.exports = (grunt) ->
    js_files = ['js/*.js']
    grunt.initConfig
        jshint:
            files: js_files
            options:
                globalstrict: true
                '-W117': true
                browser: true
                devel: true
                jquery: true
        compass:
            all_the_things:
                options:
                    sassDir: 'scss'
                    cssDir: 'css'
        watch:
            sass:
                files: ['scss/*.scss']
                tasks: ['compass']
                options:
                    spawn: true
        imagemin:
            dymamic:
                files: [
                    expand: true
                    cwd: 'images/uncompressed'
                    src: ['**/*.{png,jpg,gif}']
                    dest: 'images'
                ]

    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-jshint'
    grunt.loadNpmTasks 'grunt-contrib-compass'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-imagemin'

    grunt.registerTask('default', ['jshint', 'compass', 'imagemin', 'watch'])
