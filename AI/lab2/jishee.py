import random, copy
class Object:
 #Энэ нь хүрээлэн буй орчинд гарч болох аливаа биет объектыг илэрхийлнэ.
 #Хүссэн обьектуудаа авахын тулд та Object-ийн дэд ангиллыг үүсгэж ашиглана.
 #Объект бүр нь __ name__slot (зөвхөн гаралтанд ашигладаг)-тай байж болно .
    def __repr__(self):
        return '<%s>' % getattr(self, '__name__', self.__class__.__name__)
    def is_alive(self):
 #Амьд объектууд үнэн утгыг буцаана
        return hasattr(self, 'alive') and self.alive
    def display(self, canvas, x, y, width, height):
        #Объектын дүрслэлийг харуулах
        pass
class Agent(Object):
    #Агент бол Обьектийн дэд анги бөгөөд .програм гэсэн нэг үүрийг заавал
    #шаарддаг. Энэ нь нэг аргумент, орчны буулгалтыг авч хариу үйлдлийг буцаах
    #функц байх ёстой. (Аливаа зүйл орчны буулгалт эсвэл хариу үйлдэл нь тухайн
    #агент оршин буй орчноос хамаарна.). Програм' нь арга биш харин слот гэдгийг
    #анхаарна уу. Хэрэв энэ арга байсан бол дараа нь програм нь өөрийгөө
    #засварлаж моделоо үүсгэх боно. Нэмэлт үүрүүд байдаг. Жишээ нь гүйцэтгэл нь
    #агентын орчин дахь агентийн гүйцэтгэлийн хэмжүүр утгыг тооцоолж болно.
    def __init__(self):
        def program(percept):
            return raw_input('Percept=%s; action? ' % percept)
        self.program = program
        self.alive = True
    def TraceAgent(agent):
        #Агентын програмыг оролт, гаралтыг багцалж хэвлэнэ. Энэ нь агент тухайн
        #орчинд юу хийж байгааг харуулна.
        old_program = agent.program
        def new_program(percept):
            action = old_program(percept)
            print('%s perceives %s and does %s' % (agent, percept, action))
            return action
        agent.program = new_program
        return agent
    
class RandomAgent(Agent):
    def __init__(self, percept, actions):
        Agent.__init__(self)
        self.program = lambda percept: random.choice(actions)
        print(self.program(percept))

def randomvacuumagent():
    print("Вакуум орчноос нэг үйлдлийг санамсаргүй байдлаар сонгоно")
    percept = "Dirty"
    RandomAgent(percept, ['Right', 'Left', 'Suck', 'NoOp'])
    
    
randomvacuumagent()