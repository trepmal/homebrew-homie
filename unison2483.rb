class Unison2483 < Formula
  desc "File synchronization tool for OSX"
  homepage "https://www.cis.upenn.edu/~bcpierce/unison/"
  url "https://www.seas.upenn.edu/~bcpierce/unison//download/releases/unison-2.48.3/unison-2.48.3.tar.gz"
  sha256 "f40d3cfbe82078d79328b51acab3e5179f844135260c2f4710525b9b45b15483"

  depends_on "ocaml" => :build

  def install
    ENV.deparallelize  # if your formula fails when building in parallel
    ENV.delete "CFLAGS" # ocamlopt reads CFLAGS but doesn't understand common options
    ENV.delete "NAME" # https://github.com/Homebrew/homebrew/issues/28642
    
    # Remove unrecognized options if warned by configure
    #system "./configure", "--disable-debug",
    #                      "--disable-dependency-tracking",
    #                      "--disable-silent-rules",
    #                      "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
#    system "make", "install" # if this fails, try separate make/make install steps
#    system "make", "install" # if this fails, try separate make/make install steps
    system "make", "./mkProjectInfo"
  end

#  test do
#    system "false"
#  end
end
