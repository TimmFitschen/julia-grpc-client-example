module grpc_julia

include("caosdb.jl")
#include("EntityService_pb.jl")
#using ProtoBuf
using gRPC

controller = gRPC.gRPCController()
client = gRPC.gRPCClient(8080)

service_stub = caosdb.EntityTransactionServiceBlockingStub(client.channel)

in_entity = caosdb.Entity(eid="24")

println("request entity " * String(in_entity.eid))
out_entity = caosdb.retrieve(service_stub, controller, in_entity)

println(out_entity.description)
 


println("OK")

end # module
