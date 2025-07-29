# Neon (Serverless Postgres)

## <!--

name: Preview App

on:
pull_request:
paths: - apps/app/** - packages/auth/** - packages/db/** - packages/email/** - packages/ui/\*\*
workflow_dispatch:

env:
BRANCH_NAME: ${{ github.head_ref }}
  NEON_BRANCH_NAME: preview/${{ github.head_ref }}

jobs:
release:
name: Deployment
runs-on: ubuntu-22.04
permissions:
contents: write
pull-requests: write

    steps:
      - name: Checkout repo
        uses: actions/checkout@v4

      - name: Create Neon Branch
        id: create-branch
        uses: neondatabase/create-branch-action@v6
        with:
          project_id: ${{ secrets.NEON_PROJECT_ID }}
          branch_name: ${{ github.ref == 'refs/heads/main' && 'preview/main' || env.NEON_BRANCH_NAME }}
          api_key: ${{ secrets.NEON_API_KEY }}

      - name: Setup Node.js 22
        uses: actions/setup-node@v4
        with:
          node-version: 22.17.0

      - name: Install Vercel CLI
        run: |
          npm install vercel@latest -g
          vercel link -p 'autlin-app' --yes --token=${{ secrets.VERCEL_TOKEN }}

      - name: Set Database Environment on Vercel
        run: echo ${{ steps.create-branch.outputs.db_url }} | vercel env add DATABASE_URL preview ${{ env.BRANCH_NAME }} --token=${{ secrets.VERCEL_TOKEN }} || true

      - name: Vercel deploy
        uses: amondnet/vercel-action@v25
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.VERCEL_ORG_ID}}
          vercel-project-id: ${{ secrets.VERCEL_APP_PROJECT_ID}}
          vercel-args: ${{ github.ref == 'refs/heads/main' && '--prod' || '' }}
          github-token: ${{ secrets.GITHUB_TOKEN }}
          alias-domains: |
            autlin-app-pr-${{ github.event.pull_request.number }}.vercel.app

-->

TODO
