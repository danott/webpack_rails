// Replace default Sprocket's directives with Webpack loaders!
import 'script!imports?this=>window!jquery';
import 'script!jquery_ujs';
import 'script!coffee!turbolinks.js.coffee';

// Basically, if you're importing anything from sprockets, you'll want to use
// the script-loader. While this is possible, it's best to move as many things
// as you can to being managed by npm and Webpack.
//
// Sometimes you may run into Gem provided asset that has deep Sprocket's
// directives. In this scenario, my best advice is to grab the precompiled asset
// from sprockets via http://rails-app.dev/assets/some-asset.js, and copy into
// your vendor folder at vendor/assets/javascripts/some-asset.js,  and import it
// using the script-loader.
