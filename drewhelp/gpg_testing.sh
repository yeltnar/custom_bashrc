set +x;

export testing_dir="/tmp/gpg_testing";
export GNUPGHOME="$testing_dir/gpg_home";
export workdir="$testing_dir/workdir";

mkdir -p "$GNUPGHOME";
chmod 700 "$GNUPGHOME";

# setup directory
mkdir -p "$workdir"; 
cd "$workdir";

# generate key without passphrase (for unattended use) 
gpg --batch --passphrase '' --quick-gen-key rm_gpg_testing;

gpg --list-keys

# export keys
gpg --yes --export --output "$workdir/pub.key" rm_gpg_testing
gpg --yes --export-secret-keys --output "$workdir/private.key" rm_gpg_testing

# create test file 
date > test.txt

# encrypt (sign) and decrypt 
gpg --yes --encrypt --sign --output test.txt.enc --recipient rm_gpg_testing test.txt 
gpg --yes --decrypt --output test.dec.txt test.txt.enc

# test
echo -e '\n\ngit diff next...';
git diff test.txt test.dec.txt
echo -e 'git diff done\n';

## delete keys ##

# get fingerprint (to delete with no prompt)
finger_print=`gpg --fingerprint rm_gpg_testing | head -n2 | tail -n1`;
echo "$finger_print";

# delete pub and private key 
gpg --batch --yes --delete-secret-key "$finger_print";
gpg --batch --yes --delete-key rm_gpg_testing;

set -x;

