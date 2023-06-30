# Script to sync ADO repo to Github repo
echo " - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "✨ Reflect Azure Devops repo changes to GitHub repo"
echo " - - - - - - - - - - - - - - - - - - - - - - - - - "
SYNCDIR=$ADOSOURCESDIR/githubrepository
GITHUBCREDENTIALS="brianasz:$GITHUBPAT"
SOURCEREPO="https://$ADOCREDENTIALS@dev.azure.com/brianasz/Dispatcher-Testing/_git/Dispatcher-Testing"
SOURCEREPODIR="Dispatcher-Testing"
DESTREPO="https://$GITHUBCREDENTIALS@github.com/brianasz/dispatcher-testing.git"
DESTINATIONREPONAME="githubrepo"

echo "✨ Starting syncronization of ADO repo and GITHUB repo..."
echo "✅ Creating a working directory"
mkdir $SYNCDIR
echo "✅ Switching to the working directory"
cd $SYNCDIR
echo "✅ Cloning ADO repository"
git clone $SOURCEREPO
echo "✅ Moving into cloned repository directory"
cd $SOURCEREPODIR
echo "✅ Adding a new remote repository"
git remote add --mirror=fetch $DESTINATIONREPONAME $DESTREPO
echo "✅ Fetching from ADO repository"
git fetch $SOURCEREPO
echo "✅ Checkout to $BRANCH branch"
git checkout $BRANCH
echo "✅ Pushing to Github repository"
git push $DESTINATIONREPONAME master
echo "🥀 Script terminated..."