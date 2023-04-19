import { Injectable } from '@nestjs/common';
import * as http from 'http';

@Injectable()
export class AppService {
  getHello(): { message: string; statusCode: number } {
    return { message: 'Hello World', statusCode: 200 };
  }
}
