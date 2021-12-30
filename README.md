<p align="center">
<a href="https://github.com/TeamUltroid/UltroidWorkflow"><img src="https://github-readme-stats.vercel.app/api/pin?username=TeamUltroid&show_icons=true&theme=dracula&hide_border=true&repo=UltroidWorkflow"></a>
<a href="https://github.com/BLUE-DEVIL1134/UltroidCli"><img src="https://github-readme-stats.vercel.app/api/pin?username=BLUE-DEVIL1134&show_icons=true&theme=dracula&hide_border=true&repo=UltroidCli"></a>
</p>

<p align="center">
<a href="https://github.com/TeamUltroid/UltroidWorkflow"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FTeamUltroidWorkflow%2F&count_bg=%232100FF&title_bg=%2300BBFF&icon=github.svg&icon_color=%23000000&title=Views&edge_flat=false" />
<img src="https://img.shields.io/badge/Version-1.0.0-blueviolet?&logo=github&style=plastic" /></a>
</p>

# How to use ?

 - ⭐Star the repo if you like it !
 - Create a repo with any name on your github account. For example we will take `root` here.
 - Now in `root/.github/workflows/` create a file with `.yml` extension. Let's say `example.yml`
 - Now put these codes in `root/.github/workflows/example.yml`

```yaml tab="example.yml"
name: Run Ultroid With UltroidCli On Github Actions
on:
  schedule:
    - cron: "0 */6 * * *"
  push:
    branches:
    - main
  workflow_dispatch:

env:
  api_id: 'YOUR_API_ID'
  api_hash: 'YOUR_API_HASH'
  session: ${{ secrets.session }}
  redis_uri: ${{ secrets.redis_uri }}
  redis_password: ${{ secrets.redis_password }}
  database_url: ${{ secrets.database_url }}

jobs:
  run:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Cancel Duplicate Workflows
        uses: styfle/cancel-workflow-action@0.9.0
        with:
            all_but_latest: true
            access_token: ${{ github.token }}
      - name: Run With UltroidCli
        continue-on-error: true
        uses: teamultroid/ultroidworkflow@0.0.1
```
 - You can either give the env vars directly or via secrets !


# What's Happening ?

 - The `.yml` file you created will run -
   - Every 6 hours forever.
   - Whenever you push a commit to `main` branch.
   - Whenever you manually the workflow.
 - Then the workflow will bring the file of your `root` repo into the hosted runner.
 - Then other parallel running workflows will be cancelled.
 - Finally, It will run Ultroid with [UltroidCli](https://github.com/BLUE-DEVIL1134/UltroidCli)
