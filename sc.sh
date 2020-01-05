github_org=gebeto
my_repos="bear-pro things-trial"
src_dir=./hacks
git checkout -b monorepo-migration
for repo in $(echo $my_repos); do
  # git remote add $repo git@github.com:$github_org/$repo.git
  git remote add $repo https://github.com/$github_org/$repo
  git fetch $repo
  git read-tree --prefix=$src_dir/$repo -u $repo/master
  git add $src_dir/$repo
  git commit -m "Migrated $repo to $src_dir/$repo"
done