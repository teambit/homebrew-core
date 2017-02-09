require "language/node"
class Bit < Formula
  desc "Distributed Code Component Manager"
  homepage "https://www.bitsrc.io"
  url "https://bitsrc.jfrog.io/bitsrc/bit-brew/stable/bit/0.1.26/bit-0.1.26-brew.tar.gz"
  sha256 "9cd874261996efd138f986bfbbe80b4b5e7478766989b2af4ffc24883bdb0343"

  bottle do
    cellar :any_skip_relocation
    sha256 "521284d178e8899881ad7a1461ac3a4387661b489e2a9e79675ff967883edfbc" => :sierra
    sha256 "06a6e114c0ce663a7bda3cc422b3c47c1c16eca598305b191e0d508baf6470d8" => :el_capitan
    sha256 "86fc112094a34ee836bfe23abb3920424a50836c8c4f1a07384d558c13f47be7" => :yosemite
  end
  
  depends_on "node"

  def install
    system "npm", "install", "-g", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal "successfully initialized an empty bit scope.\n",
      shell_output("#{bin}/bit init")
  end
end
