
// GetConnectionHistoryEndpointsParameterInner.mo
/// Enum values: #filtered_stream, #sample_stream, #sample10_stream, #firehose_stream, #tweets_compliance_stream, #users_compliance_stream, #tweet_label_stream, #firehose_stream_lang_en, #firehose_stream_lang_ja, #firehose_stream_lang_ko, #firehose_stream_lang_pt, #likes_firehose_stream, #likes_sample10_stream, #likes_compliance_stream

module {
    // User-facing type: type-safe variants for application code
    public type GetConnectionHistoryEndpointsParameterInner = {
        #filtered_stream;
        #sample_stream;
        #sample10_stream;
        #firehose_stream;
        #tweets_compliance_stream;
        #users_compliance_stream;
        #tweet_label_stream;
        #firehose_stream_lang_en;
        #firehose_stream_lang_ja;
        #firehose_stream_lang_ko;
        #firehose_stream_lang_pt;
        #likes_firehose_stream;
        #likes_sample10_stream;
        #likes_compliance_stream;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetConnectionHistoryEndpointsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetConnectionHistoryEndpointsParameterInner) : JSON =
            switch (value) {
                case (#filtered_stream) "filtered_stream";
                case (#sample_stream) "sample_stream";
                case (#sample10_stream) "sample10_stream";
                case (#firehose_stream) "firehose_stream";
                case (#tweets_compliance_stream) "tweets_compliance_stream";
                case (#users_compliance_stream) "users_compliance_stream";
                case (#tweet_label_stream) "tweet_label_stream";
                case (#firehose_stream_lang_en) "firehose_stream_lang_en";
                case (#firehose_stream_lang_ja) "firehose_stream_lang_ja";
                case (#firehose_stream_lang_ko) "firehose_stream_lang_ko";
                case (#firehose_stream_lang_pt) "firehose_stream_lang_pt";
                case (#likes_firehose_stream) "likes_firehose_stream";
                case (#likes_sample10_stream) "likes_sample10_stream";
                case (#likes_compliance_stream) "likes_compliance_stream";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetConnectionHistoryEndpointsParameterInner =
            switch (json) {
                case "filtered_stream" ?#filtered_stream;
                case "sample_stream" ?#sample_stream;
                case "sample10_stream" ?#sample10_stream;
                case "firehose_stream" ?#firehose_stream;
                case "tweets_compliance_stream" ?#tweets_compliance_stream;
                case "users_compliance_stream" ?#users_compliance_stream;
                case "tweet_label_stream" ?#tweet_label_stream;
                case "firehose_stream_lang_en" ?#firehose_stream_lang_en;
                case "firehose_stream_lang_ja" ?#firehose_stream_lang_ja;
                case "firehose_stream_lang_ko" ?#firehose_stream_lang_ko;
                case "firehose_stream_lang_pt" ?#firehose_stream_lang_pt;
                case "likes_firehose_stream" ?#likes_firehose_stream;
                case "likes_sample10_stream" ?#likes_sample10_stream;
                case "likes_compliance_stream" ?#likes_compliance_stream;
                case _ null;
            };
    }
}
