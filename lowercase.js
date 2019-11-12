const input = process.argv[2];

if( input===undefined ){
    process.exit();
}

console.log(input.toLowerCase());