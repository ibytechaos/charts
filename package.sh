helm package stable-diffusion && mv *.tgz charts && helm repo index . && cp index.yaml charts && git add . && git commit -m "push"  && git push -u origin page