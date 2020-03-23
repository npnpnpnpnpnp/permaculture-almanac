# README

The _pw-vue-kickstart_ repository serves as a starting point for websites built on top of [ProcessWire](https://processwire.com/) and [Vue.js](https://vuejs.org/). They reside in their separate directories inside `/backend/` and `/frontend/` respectively.

## Preparation

1. Initialize a new (private) repository on GitHub.

2. Switch to the project folder and run the following commands to duplicate the _pw-vue-kickstart_ repository:

```console
git clone --bare git@github.com:dsdsdsdsdsds/pw-vue-kickstart.git
cd pw-vue-kickstart.git
git push --mirror git@github.com:dsdsdsdsdsds/PROJECT.git
cd ..
rm -rf pw-vue-kickstart.git
```

3. Clone the repository to localhost and continue with installation.

4. Switch to the new repo directory and add _pw-vue-kickstart_ as a remote:

```console
git remote add default git@github.com:dsdsdsdsdsds/pw-vue-kickstart.git
```

## Update repository

Whenever there are new commits made to the _pw-vue-kickstart_ that should be applied to one of its instances, simply [fetch](https://git-scm.com/docs/git-fetch) them:

```console
git fetch default master
```

List the new commits:

```console
git log --oneline master..default/master
```

Pick commits with [git-cherry-pick](https://git-scm.com/docs/git-cherry-pick):

```console
git cherry-pick -x <commit>`
```

If everything works fine, [push](https://help.github.com/articles/pushing-to-a-remote/) them to _origin_:

```console
git push origin master
```

## Backend

All paths in this chapter are relative to the `/backend/` folder.

### Installation

Note: In case ProcessWire is already installed, then directly go to _Setup_.

1. [Download](https://processwire.com/download/core/) the latest ProcessWire archive and extract its content to the `dist/` folder.
2. Create a MySQL database with a _utfmb4_unicode_ci_ collation.
3. Initiate the ProcessWire installer in the browser.
4. Select the _Headless_ site profile during installation.
5. After installation, duplicate `config.php` and rename it to `config-default.php`. Clear out the database connection credentials. Also duplicate `.htaccess` and rename it to `htaccess.txt`.

### Setup

In case ProcessWire is already installed in the `dist/` directory, then simply grab the latest database dump under `dist/site/assets/backups/database/` and import it to a local database. Afterwards **duplicate** `config-default.php`, rename the copy to `config.php` and enter the database credentials. Also **duplicate** `htaccess.txt` and rename the copy to `.htaccess`. When setting up a local webserver, the document root has to point to the `dist/` directory.

On a live server, make sure to [optimize the handling of 404s](https://processwire.com/blog/posts/optimizing-404s-in-processwire/) and only allow HTTPS connections (inside `.htaccess` file).

### Directory structure

There is currently only a `dist/` directory that initially holds the _Headless_ site profile. After installing ProcessWire, it contains all files that are meant to be deployed to the webserver on a separate subdomain (e.g. backend.mydomain.com).

Within `dist/site/templates/api/` resides the API. It is by default reachable via `/api/` in the browser.

### Deployment

TBD

## Frontend

The Frontend has been initiated with [Vue CLI](https://cli.vuejs.org/) and takes some inspiration from [Vue Enterprise Boilerplate](https://github.com/chrisvfritz/vue-enterprise-boilerplate).

All paths in this chapter are relative to the `/frontend/` folder.

### Installation

Within the `/frontend/` folder run the following command:

```console
npm i
```

To start developing, run...

```console
npm run serve
```

### Setup

Adjust the values inside `.env` and `.env.production` and add `.env.development.local` to set the local development variables.

### Directory structure

The directory structure closely follows the one initiated by Vue CLI.

### Deployment

TBD
