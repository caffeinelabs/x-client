import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Connection.mo

module {
    public type Connection = {
        /// The IP address of the connected client.
        client_ip : ?Text;
        /// The timestamp when the connection was established.
        connected_at : Text;
        /// The reason for disconnection, if the connection is inactive.
        disconnect_reason : ?Text;
        /// The timestamp when the connection was disconnected, if applicable.
        disconnected_at : ?Text;
        /// The name of the streaming endpoint.
        endpoint_name : Text;
    };

    public module JSON {
        // `init` constructs a Connection from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Connection.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            connected_at : Text;
            endpoint_name : Text;
        }) : Connection {
            let ?res = from_candid(to_candid(required)) : ?Connection else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Connection) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.client_ip) {
                case (?v__) List.add(buf, ("client_ip", #Text(v__)));
                case null ();
            };
            List.add(buf, ("connected_at", #Text(value.connected_at)));
            switch (value.disconnect_reason) {
                case (?v__) List.add(buf, ("disconnect_reason", #Text(v__)));
                case null ();
            };
            switch (value.disconnected_at) {
                case (?v__) List.add(buf, ("disconnected_at", #Text(v__)));
                case null ();
            };
            List.add(buf, ("endpoint_name", #Text(value.endpoint_name)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Connection =
            switch (candid) {
                case (#Record(fields)) {
                    let client_ip : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "client_ip")) {
                        case (?client_ip_field) ((switch (client_ip_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?connected_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "connected_at") else return null;
                    let ?connected_at = ((switch (connected_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let disconnect_reason : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "disconnect_reason")) {
                        case (?disconnect_reason_field) ((switch (disconnect_reason_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let disconnected_at : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "disconnected_at")) {
                        case (?disconnected_at_field) ((switch (disconnected_at_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?endpoint_name_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "endpoint_name") else return null;
                    let ?endpoint_name = ((switch (endpoint_name_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        client_ip;
                        connected_at;
                        disconnect_reason;
                        disconnected_at;
                        endpoint_name;
                    };
                };
                case _ null;
            };
    };
};
