class Product
    attr_accessor :name, :sizes
    def initialize(name,*sizes)
        @name = name
        @sizes = sizes.map(&:to_i)
    end
end

products_list = []
data = []
File.open('catalogo.txt', 'r') { |file| data = file.readlines}
data.each do |prod|
    ls = prod.split(', ')
    products_list << Product.new(*ls)
end

nuevo_catalogo = []
File.open('nuevo_catalogo', 'w')
products_list.each do |product|
    product.sizes.pop
    File.write('nuevo_catalogo.txt', "#{product.name}, #{product.sizes.join(',')} \n", mode:'a')
end    