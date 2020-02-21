require 'ruby-progressbar'

@progressbar = ProgressBar.create
def add(num=1, speed=0.05)
  num.times{@progressbar.increment ; sleep speed}
end

def minus(num=1, speed=0.05)
  num.times{@progressbar.decrement ; sleep speed}
end

add(25)
add(25, 0.1)
add(20, 0.2)
add(10, 0.4)
add(7, 0.5)
add(10,1 )
minus(30, 0.01)
add(20)
minus(20, 0.4)
add(20, 0.1)
add(10, 1)
minus(70)




# 50.times{progressbar.increment ; sleep 0.01}
# 50.times{progressbar.progress -= 1 ; sleep 0.01}