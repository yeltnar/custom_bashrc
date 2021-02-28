const util = require('util');
const exec = util.promisify(require('child_process').exec);
(async()=>{
    const git_status=(await exec(`cd ${process.env.custom_bashrc_folder};git status`));
    if(git_status.stdout.includes("Your branch is up-to-date")||git_status.stdout.includes("Your branch is up to date")){
        console.log('branch is up to date');
    }else{
        console.log(`pulling bashrc`);
        console.log(await exec(`cd ${process.env.custom_bashrc_folder};git pull`));
    }
})();