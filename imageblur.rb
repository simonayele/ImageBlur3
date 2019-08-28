class Image
 
   def  initialize (array)
         @image = array
   end

   def output_image
    @image.each do |x|
      puts x.join
    end
   end


#Finding coordinates of the cells that contain 1


def coordinates
   coord=[]
   @image.each_with_index do |row, y|
      row.each_with_index do |value ,x|
        if value==1
          coord<<[y,x]
        end
     end
    end
  return coord
end

# transforming the image with the 


def blur
  final_coord = coordinates 
  final_coord.each do |set|
      y=set[0]
      x=set[1]
      @image[y-1][x]=1 unless y <= 0 
      @image[y+1][x]=1 unless y >= @image.length-1
      @image[y][x-1]=1 unless x <= 0 
      @image[y][x+1]=1 unless x >= @image[0].length-1
  end
end

def blur_distance(n)
        n.times do 
            blur
        end
end

       

end


image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0]
])
image.blur_distance(2)
image.output_image

