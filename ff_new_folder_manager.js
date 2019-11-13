const fs = require("fs");

const ff_dir = "/tmp/ff_new";

(()=>{

    const dir_list = readDir();

    console.log(dir_list);

})();

function readDir(){

    const dir_list = fs.readDir(ff_dir);

    return dir_list;
}