import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateDmEventResponseData.mo

module {
    public type CreateDmEventResponseData = {
        /// Unique identifier of a DM conversation. This can either be a numeric string, or a pair of numeric strings separated by a '-' character in the case of one-on-one DM Conversations.
        dm_conversation_id : Text;
        /// Unique identifier of a DM Event.
        dm_event_id : Text;
    };

    public module JSON {
        public func toCandidValue(value : CreateDmEventResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("dm_conversation_id", #Text(value.dm_conversation_id)));
            List.add(buf, ("dm_event_id", #Text(value.dm_event_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateDmEventResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let ?dm_conversation_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "dm_conversation_id") else return null;
                    let ?dm_conversation_id = ((switch (dm_conversation_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?dm_event_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "dm_event_id") else return null;
                    let ?dm_event_id = ((switch (dm_event_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        dm_conversation_id;
                        dm_event_id;
                    };
                };
                case _ null;
            };
    };
};
