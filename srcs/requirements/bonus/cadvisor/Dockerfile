# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juzoanya <juzoanya@student.42wolfsburg,    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/23 17:17:19 by juzoanya          #+#    #+#              #
#    Updated: 2023/08/25 23:02:18 by juzoanya         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update && apt install -y wget

RUN wget https://github.com/google/cadvisor/releases/download/v0.37.0/cadvisor

RUN chmod +x cadvisor


CMD ["./cadvisor"]