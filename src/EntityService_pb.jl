# syntax: proto3
using ProtoBuf
import ProtoBuf.meta

mutable struct Entity <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function Entity(; kwargs...)
        obj = new(meta(Entity), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct Entity
const __meta_Entity = Ref{ProtoMeta}()
function meta(::Type{Entity})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Entity)
            __meta_Entity[] = target = ProtoMeta(Entity)
            allflds = Pair{Symbol,Union{Type,String}}[:eid => AbstractString, :name => AbstractString, :description => AbstractString]
            meta(target, Entity, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_Entity[]
    end
end
function Base.getproperty(obj::Entity, name::Symbol)
    if name === :eid
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :description
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

# service methods for EntityTransactionService
const _EntityTransactionService_methods = MethodDescriptor[
        MethodDescriptor("retrieve", 1, caosdb.Entity, caosdb.Entity)
    ] # const _EntityTransactionService_methods
const _EntityTransactionService_desc = ServiceDescriptor("caosdb.EntityTransactionService", 1, _EntityTransactionService_methods)

EntityTransactionService(impl::Module) = ProtoService(_EntityTransactionService_desc, impl)

mutable struct EntityTransactionServiceStub <: AbstractProtoServiceStub{false}
    impl::ProtoServiceStub
    EntityTransactionServiceStub(channel::ProtoRpcChannel) = new(ProtoServiceStub(_EntityTransactionService_desc, channel))
end # mutable struct EntityTransactionServiceStub

mutable struct EntityTransactionServiceBlockingStub <: AbstractProtoServiceStub{true}
    impl::ProtoServiceBlockingStub
    EntityTransactionServiceBlockingStub(channel::ProtoRpcChannel) = new(ProtoServiceBlockingStub(_EntityTransactionService_desc, channel))
end # mutable struct EntityTransactionServiceBlockingStub

retrieve(stub::EntityTransactionServiceStub, controller::ProtoRpcController, inp::caosdb.Entity, done::Function) = call_method(stub.impl, _EntityTransactionService_methods[1], controller, inp, done)
retrieve(stub::EntityTransactionServiceBlockingStub, controller::ProtoRpcController, inp::caosdb.Entity) = call_method(stub.impl, _EntityTransactionService_methods[1], controller, inp)

export Entity, EntityTransactionService, EntityTransactionServiceStub, EntityTransactionServiceBlockingStub, retrieve
