const util = require('util');
const exec = util.promisify(require('child_process').exec);
(async()=>{
    if(!(await exec(`cd ${process.env.custom_bashrc_folder};git status`)).stdout.includes("Your branch is up-to-date")){
        console.log(`pulling bashrc`);
        console.log(await exec(`cd ${process.env.custom_bashrc_folder};git pull`));
    }else{
        console.log('branch is up to date');
    }
})();