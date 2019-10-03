# README

The *pw-vue-kickstart* repository serves as a starting point for websites built on top of [ProcessWire](https://processwire.com/)  and [Vue.js](https://vuejs.org/). They reside in their separate directories inside `/backend/` and `/frontend/` respectively.

## Preparation

1. Initialize a new (private) repository on GitLab.

2. Switch to the project folder and run the following commands to duplicate the *pw-vue-kickstart* repository:

    ```
    $ git clone --bare git@gitlab.com:dsdsdsdsdsds/pw-vue-kickstart.git
    $ cd pw-vue-kickstart.git
    $ git push --mirror git@gitlab.com:dsdsdsdsdsds/pw-vue-PROJECT.git
    $ cd ..
    $ rm -rf pw-vue-kickstart.git
    ```

3. Clone the repository to localhost and continue with installation.

4. Switch to the new repo directory and add *pw-vue-kickstart* as a remote:

    ```
    $ git remote add default git@gitlab.com:dsdsdsdsdsds/pw-vue-kickstart.git
    ```

## Update repository

Whenever there are new commits made to the *pw-vue-kickstart* that should be applied to one of its instances, simply [fetch](https://git-scm.com/docs/git-fetch) them:

```
$ git fetch default master
```

List the new commits:

```
$ git log --oneline master..default/master
```

Pick commits with [git-cherry-pick](https://git-scm.com/docs/git-cherry-pick):

```
$ git cherry-pick -x <commit>`
```

If everything works fine, [push](https://help.github.com/articles/pushing-to-a-remote/) them to *origin*:

```
$ git push origin master
```

## Backend

All paths in this chapter are relative to the `/backend/` folder.

### Installation

1. [Download](https://processwire.com/download/core/) the latest ProcessWire archive and extract its content to the `dist/` folder.
2. Create a MySQL database with a *utfmb4_unicode_ci* collation.
3. Initiate the ProcessWire installer in the browser.
4. Select the *Headless* site profile during installation.
5. After installation, duplicate `config.php` and rename it to `config-default.php`. Clear out the database connection credentials.

### Setup

In case ProcessWire is already installed in the `dist/` directory, then simply grab the latest database dump under `dist/site/assets/backups/database/` and import it to a local database. Afterwards **duplicate** `config-default.php`, rename the copy to `config.php` and enter the database credentials. Also **duplicate** `htaccess.txt` and rename the copy to `.htaccess`. When setting up a local webserver, the document root has to point to the `dist/` directory.

On a live server, make sure to [optimize the handling of 404s](https://processwire.com/blog/posts/optimizing-404s-in-processwire/) and only allow HTTPS connections (see #9 in `.htaccess` file).

### Directory structure

There is currently only a `dist/` directory that initially holds the *Headless* site profile. After installing ProcessWire, it contains all files that are meant to be deployed to the webserver on a separate subdomain (e.g. backend.mydomain.com).

Within `dist/site/templates/api/` resides the API. It is by default reachable via `/api/` in the browser.

### Deployment

In order to set up the website deployment, login to your webserver via SSH and switch to the document root. Make sure Git is available:

```
$ git --version
```

Then run the following commands:

```
$ [ -d ~/git ] || mkdir ~/git && cd ~/git
$ mkdir pw-vue-PROJECT.git
$ cd pw-vue-PROJECT.git
$ git init --bare
$ git config core.sparseCheckout true
$ echo backend/dist >> info/sparse-checkout
$ touch hooks/post-receive
```

Add the following code to the newly created `post-receive` file. Make sure to adjust the paths at the top accordingly:

```
#!/bin/sh
GIT_DIR=/git/pw-vue-PROJECT.git
WORK_DIR=/public_html

# remove any untracked files and directories (except the excluded ones)
git --work-tree=${WORK_DIR} --git-dir=${GIT_DIR} clean -fd --exclude=/.htaccess --exclude=/site/config.php --exclude=/site/assets

# force checkout of the latest deploy
git --work-tree=${WORK_DIR} --git-dir=${GIT_DIR} checkout -f

# copy contents of dist/ to working directory and remove backend/dist/ afterwards
cp -a ${WORK_DIR}/backend/dist/. ${WORK_DIR}
rm -rf ${WORK_DIR}/backend
```

Set the correct permissions:

```
$ chmod +x hooks/post-receive
```

Switch back to your local machine and add a new remote to the repository:

```
$ git remote add production ssh://USER@SERVER:PORT/git/pw-vue-PROJECT.git
```

List remotes to check if everything is configured correctly:

```
$ git remote -v
```

To push changes to production, run the following command. **Warning: Changes will be online immediately!**

```
$ git push production master
```

## Frontend

The Frontend has been initiated with [Vue CLI](https://cli.vuejs.org/) and takes some inspiration from [Vue Enterprise Boilerplate](https://github.com/chrisvfritz/vue-enterprise-boilerplate).

All paths in this chapter are relative to the `/frontend/` folder.

### Installation

Within the `/frontend/` folder run the following command:

```
$ npm i
```

To start developing, run...

```
$ npm run serve
```

### Setup

Adjust the values inside `.env` and `.env.production` and add `.env.development.local` to set the local development variables.

### Directory structure

The directory structure closely follows the one initiated by Vue CLI.

### Deployment

Use [Modern Mode](https://cli.vuejs.org/guide/browser-compatibility.html#modern-mode) if appropriate.
