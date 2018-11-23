require "mime_type_list/version"

module MimeTypeList
  class BaseMimeTypes
    private

      def append_non_standard_extensions(extensions)
        NON_STANDARD_EXTENSIONS.each do |ext|
          unless extensions.include?(ext)
            extensions << ext
          end
        end
        extensions
      end
  end

  class AudioMimeTypes < BaseMimeTypes
    class << self
      NON_STANDARD_EXTENSIONS = ["m4a"].freeze

      def extensions_for(mime_type)
        mime_types = MIME::Types[mime_type]
        mime_types.map {|t| t.extensions }.flatten
      end

      def all_extensions
        @all_extensions ||= all_mime_types.inject([]) do |array, mime_type|
          array << extensions_for(mime_type)
          array
        end.flatten.uniq.sort
        append_non_standard_extensions(extensions)
      end

      def all_mime_types
        %W{
          application/mp4
          audio/aac
          audio/mpeg
          audio/ogg
          audio/wav
          audio/mp4
          audio/mp4a-es
          audio/mpeg
          audio/mpeg4
        }
      end

    end
  end

  class VideoMimeTypes < BaseMimeTypes
    class << self

      NON_STANDARD_EXTENSIONS = ["m4v"].freeze

      def extensions_for(mime_type)
        mime_types = MIME::Types[mime_type]
        mime_types.map {|t| t.extensions }.flatten
      end

      def all_extensions
        extensions = @all_extensions ||= all_mime_types.inject([]) do |array, mime_type|
          array << extensions_for(mime_type)
          array
        end.flatten.uniq.sort
        append_non_standard_extensions(extensions)
      end

      def all_mime_types
        %W{
          application/annodex
          application/mp4
          application/ogg
          application/vnd.rn-realmedia
          application/x-matroska
          video/3gpp
          video/3gpp2
          video/annodex
          video/divx
          video/flv
          video/h264
          video/mp4
          video/mp4v-es
          video/mpeg
          video/mpeg-2
          video/mpeg4
          video/ogg
          video/ogm
          video/quicktime
          video/ty
          video/vdo
          video/vivo
          video/vnd.rn-realvideo
          video/vnd.vivo
          video/webm
          video/x-bin
          video/x-cdg
          video/x-divx
          video/x-dv
          video/x-flv
          video/x-la-asf
          video/x-m4v
          video/x-matroska
          video/x-motion-jpeg
          video/x-ms-asf
          video/x-ms-dvr
          video/x-ms-wm
          video/x-ms-wmv
          video/x-msvideo
          video/x-sgi-movie
          video/x-tivo
          video/avi
          video/x-ms-asx
          video/x-ms-wvx
          video/x-ms-wmx
        }
      end
    end
  end
end
