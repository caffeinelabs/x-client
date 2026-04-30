import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// GetSpacesByIdsExpansionsParameterInner.mo
/// Enum values: #creator_id, #host_ids, #invited_user_ids, #speaker_ids, #topic_ids

module {
    public type GetSpacesByIdsExpansionsParameterInner = {
        #creator_id;
        #host_ids;
        #invited_user_ids;
        #speaker_ids;
        #topic_ids;
    };

    public module JSON {
        public func toCandidValue(value : GetSpacesByIdsExpansionsParameterInner) : Candid.Candid =
            switch (value) {
                case (#creator_id) #Text("creator_id");
                case (#host_ids) #Text("host_ids");
                case (#invited_user_ids) #Text("invited_user_ids");
                case (#speaker_ids) #Text("speaker_ids");
                case (#topic_ids) #Text("topic_ids");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetSpacesByIdsExpansionsParameterInner =
            switch (candid) {
                case (#Text("creator_id")) ?#creator_id;
                case (#Text("host_ids")) ?#host_ids;
                case (#Text("invited_user_ids")) ?#invited_user_ids;
                case (#Text("speaker_ids")) ?#speaker_ids;
                case (#Text("topic_ids")) ?#topic_ids;
                case _ null;
            };

        public func toText(value : GetSpacesByIdsExpansionsParameterInner) : Text =
            switch (value) {
                case (#creator_id) "creator_id";
                case (#host_ids) "host_ids";
                case (#invited_user_ids) "invited_user_ids";
                case (#speaker_ids) "speaker_ids";
                case (#topic_ids) "topic_ids";
            };
    };
};
