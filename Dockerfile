FROM ros:jade-perception
WORKDIR /root
ADD scripts/*.sh ./
RUN chmod +x *.sh
RUN ./fixnetwork.sh && ./build.sh

ENTRYPOINT ["/root/ros_entrypoint.sh"]
CMD ["roslaunch", "dvo_benchmark", "benchmark.launch", "dataset:=/dataset"]
