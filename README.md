#BUILD IMAGE:
docker build -t nextjs-app-image .

#RUN:
docker run --name fullstack-app -p 3000:3000 nextjs-app-image
