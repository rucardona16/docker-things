FROM cassandra:2.2.8

RUN apt-get update && apt-get install -y netcat

COPY ./iotcommerce_schema.cql ./
COPY ./wait-for-cassandra.sh ./

CMD ./wait-for-cassandra.sh; sleep infinity
#CMD cqlsh -e "source 'iotcommerce_schema.cql'"

#EXPOSE 32781